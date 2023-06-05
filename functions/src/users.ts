import * as admin from "firebase-admin";
import * as functions from "firebase-functions";


export const onUserDeleted = functions.firestore.document('/users/{userId}')
    .onDelete(async (snap, _) => {
        try {
            const userId = snap.data().userId;
            await admin.auth().deleteUser(userId);
        } catch (error) {
            console.error('Erro ao deletar usuário:', error);
        }
    });
