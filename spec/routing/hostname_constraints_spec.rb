require "rails_helper"
describe "ルーティング" do 
   example "職員ページ" do
    config = Rails.application.config.kiroku2
    url = "https://#{config[:caregiver][:host]}/#{config[:caregiver][:path]}"
    expect(get: url).to route_to(
      host: config[:caregiver][:host],
      controller: "care_recipitent/top",
      action: "index"
    )
   end

   example "家族ページ" do
    config = Rails.application.config.kiroku2
    url = "https://#{config[:family][:host]}/#{config[:family][:path]}"
    expect(get: url).to route_to(
      host: config[:family][:host],
      controller: "family/families",
      action: "top"
    )
   end

end
