"use strict";

module.exports = {
  rules: {
    "selector-class-pattern": [
      "^([A-Z][a-zA-Z0-9]*)((_{1,2}([A-Z][a-zA-Z0-9]+)*)*(-{2}([a-z0-9]+))*)$",
      {
        message:
          "Expected Class name to be BEM-case ;) @expitc\n https://en.bem.info/methodology/naming-convention/#react-style",
      },
    ],
    "selector-id-pattern": [
      "^([A-Z][a-zA-Z0-9]*)((_{1,2}([A-Z][a-zA-Z0-9]+)*)*(-{2}([a-z0-9]+))*)$",
      {
        message:
          "Expected id name to be BEM-case ;) @expitc\n https://en.bem.info/methodology/naming-convention/#react-style",
      },
    ],
    "keyframes-name-pattern": [
      "^([A-Z][a-zA-Z0-9]*)((_{1,2}([A-Z][a-zA-Z0-9]+)*)*(-{2}([a-z0-9]+))*)$",
      {
        message:
          "Expected keyframes name to be BEM-case ;) @expitc\n https://en.bem.info/methodology/naming-convention/#react-style",
      },
    ],
  },
};
