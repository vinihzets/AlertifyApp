import * as functions from "firebase-functions";
import * as admin from "firebase-admin";


export const onNotificationCreated = functions.firestore.document('/notifications/{notificationId}')
    .onCreate(async (snap, _) => {

        const data = snap.data();

        const title = data.title;

        const body = data.body;

        const users = await admin.firestore().collection('users')
            .where('active', '==', true)
            .get();


        return sendNotificationToUsers(title, body, users.docs.map((element) => element.data()));
    });

const sendNotificationToUsers = async (title: string, body: string, users: Array<FirebaseFirestore.DocumentData
>) => {

    if (users.length == 0) {
        return;
    }

    const fcmTokens = users.map((v) => v['fcmToken']);


    const validFcmTokens = new Array<string>();

    for (let i = 0; i < fcmTokens.length; i++) {
        const token = fcmTokens[i] as string;
        if (token != undefined && token.length != 0) {
            validFcmTokens.push(fcmTokens[i]);
        }
    }

    if (validFcmTokens.length == 0) {
        return;
    }


    const message = {
        notification: {
            title: title,
            body: body,
        },
        apns: {
            headers: {
                'apns-priority': '10',
            },
            payload: {
                aps: {
                    sound: 'default',
                }
            },
        },
        tokens: validFcmTokens,
    };

    console.log(message);

    return await admin.messaging().sendMulticast(message);
}