require 'rails_helper'

describe "IPアドレスによるアクセス制限" do
  before do
    Rails.application.config.kiroku2[:restrict_ip_adresses] = true
  end

  it "許可" do
    AllowedSource.create!(namespace: "caregiver", ip_address: "127.0.0.1")
    get caregiver_root_url
    expect(response.status).to eq(200)
  end

  it "拒否" do
    AllowedSource.create!(namespace: "caregiver", ip_address: "192.168.0.*")
    get caregiver_root_url
    expect(response.status).to eq(403)
  end

end
