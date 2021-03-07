Rails.application.configure do
  config.kiroku2 = {
    caregiver: { host: "kiroku2.application.com", path: "" },
    family: { host: "kiroku2.application.com", path: "family" }
  }
end
