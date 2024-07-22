const admin = require('firebase-admin');
const { Base64 } = require('js-base64');

// Decode the base64-encoded service account key
const serviceAccountKeyBase64 = process.env.FIREBASE_CREDENTIALS;

if (!serviceAccountKeyBase64) {
    throw new Error('Environment variable FIREBASE_CREDENTIALS is not set.');
}

let serviceAccountKey;
try {
    serviceAccountKey = JSON.parse(Base64.decode(serviceAccountKeyBase64));
} catch (err) {
    throw new Error('Failed to decode or parse FIREBASE_CREDENTIALS: ' + err.message);
}

// Initialize Firebase Admin SDK
admin.initializeApp({
    credential: admin.credential.cert(serviceAccountKey),
    storageBucket: `${process.env.PROJECT_ID}.appspot.com`
});

const bucket = admin.storage().bucket();

const uploadFileToFirebase = async (filePath, destination) => {
    const [file] = await bucket.upload(filePath, {
        destination: destination,
        metadata: {
            contentType: 'application/pdf',
        },
    });

    const [url] = await file.getSignedUrl({
        action: 'read',
        expires: '03-01-2500', // Long expiration time
    });
    return url;
};

module.exports = {
    uploadFileToFirebase
}
