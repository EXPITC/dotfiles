"use strict";

module.exports = {
  rules: {
    "selector-class-pattern": [
      "^([A-Z][a-zA-Z0-9]*)((-{1}([A-Z][a-zA-Z0-9]+)*)*(_{1}([a-z0-9][a-zA-Z0-9]+))*)$",
      {
        message: (selector) =>
          `Expected Class ${selector} to be BEM-case #React-style ;) @expitc\n https://en.bem.info/methodology/naming-convention/#react-style`,
      },
    ],
    "selector-id-pattern": [
      "^([A-Z][a-zA-Z0-9]*)((-{1}([A-Z][a-zA-Z0-9]+)*)*(_{1}([a-z0-9][a-zA-Z0-9]+))*)$",
      {
        message: (selector) =>
          `Expected id ${selector} to be BEM-case #React-style ;) @expitc\n https://en.bem.info/methodology/naming-convention/#react-style`,
      },
    ],
    "keyframes-name-pattern": [
      "^([A-Z][a-zA-Z0-9]*)((-{1}([A-Z][a-zA-Z0-9]+)*)*(-{2}([a-z0-9][a-zA-Z0-9]+))*)$",
      {
        message: (selector) =>
          `Expected keyframes ${selector} to be BEM-case #React-style ;) @expitc\n https://en.bem.info/methodology/naming-convention/#react-style`,
      },
    ],
  },
};
