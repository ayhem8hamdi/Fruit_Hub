const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

// 👇 Updates password after phone verification
exports.updatePassword = functions.https.onCall(async (data, context) => {
  // 1. Check if request is authorized (optional but recommended)
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Only authenticated users can update passwords."
    );
  }

  // 2. Get email & new password from request
  const { email, newPassword } = data;

  // 3. Validate inputs
  if (!email || !newPassword) {
    throw new functions.https.HttpsError(
      "invalid-argument",
      "Email and new password are required."
    );
  }

  try {
    // 4. Find user by email
    const user = await admin.auth().getUserByEmail(email);

    // 5. Update password
    await admin.auth().updateUser(user.uid, {
      password: newPassword,
    });

    return { success: true, message: "✅ Password updated!" };
  } catch (error) {
    throw new functions.https.HttpsError(
      "internal",
      "❌ Failed to update password: " + error.message
    );
  }
});