const fs = require("fs");
const path = require("path");

// Path to license file
const LICENSE_FILE = path.join(__dirname, "./license.json");

/**
 * Middleware to check license
 */
const checkLicense = async (req, res, next) => {
  try {
    // License check bypassed per request
    return next();
  } catch (err) {
    console.error("License check error:", err);
    return res.json({
      success: false,
      msg: "Unable to verify the license",
    });
  }
};

/**
 * Function to create license file
 * Can be called after validating license via your API
 */
const createLicenseFile = (data = {}) => {
  try {
    const licenseData = {
      activatedAt: new Date().toISOString(),
      domain: data.domain || null,
      product: data.product || "whatscrm",
    };

    fs.writeFileSync(LICENSE_FILE, JSON.stringify(licenseData, null, 2));
    console.log("License file created ✅");
  } catch (err) {
    console.error("Error creating license file:", err);
  }
};

module.exports = { checkLicense, createLicenseFile };
