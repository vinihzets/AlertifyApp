const functions = require('firebase-functions');
const admin = require('firebase-admin');


exports.deleteUser = functions.https.onCall(async (data: { userId: any; }, context: any) => {
    const userId = data.userId;

    try {
        await admin.auth().deleteUser(userId);

        return { success: true };
    } catch (error) {
        console.error('Erro ao deletar usuário:', error);
        return { error: 'Erro ao deletar usuário.' };
    }
});