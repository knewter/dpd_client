# DPD Client

This is a simple API client for the DPD API.  Running the tests requires you to
have three ENV vars set:

- GETDPD_USERNAME
- GETDPD_API_KEY
- GETDPD_STORE_ID

Once you've set those, you should be able to just `mix test` and verify it works
against your account.

NOTE: `GETDPD_API_KEY` can be found on your DPD profile page.
