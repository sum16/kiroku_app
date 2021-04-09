20.times do |n|
CustomerInformation.create(
    title: "お知らせ#{n}",
    body: "内容#{n}"
)
end
