# Security deployment changes

Revoke the previously committed OpenAI API credential. OPENAI_API_KEY is now read only from the local development process environment. A distributed app must call an authenticated backend that stores the provider credential. Do not embed a replacement key in app source, build variables, or the app bundle.
