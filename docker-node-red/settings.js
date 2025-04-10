module.exports = {
  userDir: "/data",
  flowFilePretty: false,
  flowFileContainment: false,
  logging: {
    console: {
      level: "info",
      metrics: false,
    },
  },
  credentialSecret: process.env.NODE_RED_CREDENTIAL_SECRET,
};
