# Generate client's API via OpenAPI Generator

## Breizh Blok API

- Retrieve the `openapi.json` from `Breizh Blok API` (`/docs.jsonopenapi`)
- Copy the json file in the `openapi/breizh_blok_api` folder
- Generate the client

```bash
fvm dart run melos run generate:breizh_blok_api
```