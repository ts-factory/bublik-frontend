[SPDX-License-Identifier: Apache-2.0]::
[SPDX-FileCopyrightText: 2024 OKTET LTD]::

## This repository builds Bublik UI and commits artifacts in `dist` folder

### How to add new build artifact

1. Open `config.json`
2. Add config for application to be built

Example config:

```json
{
  "base": "/prefix/v2",
  "output": "output-folder-name"
}
```

This config will produce folder `output-folder-name` at `dist/output-folder-name`
Be aware that this application will be expected **to be published at URL `/prefix/v2`**

### Caveat

Currently, all applications to be built are expected to have `/v2` postfix at the end

- `/v2` is required

Example:
```json
{
    "base":  "${YOUR_PREFIX}/v2",
    "output": "output-folder"
}
```
