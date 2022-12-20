# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "🌱 Seeding..."
Tender.destroy_all
Tenderer.destroy_all
Supplier.destroy_all
Proposal.destroy_all
ProposalScore.destroy_all

# kra_images =["https://educationnewshub.co.ke/wp-content/uploads/2020/12/taxcomp.png",
#             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlOy0DGb5tdZ-E1Q-g5hWrQ_lR7c1ujkMVlw&usqp=CAU",
#             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5bfbcq_RT-KQ3pTNqLodOYvCUcKRZBw9OvQ&usqp=CAU"
# ]

puts "🌱 Seeding Tenderers..."
3.times do
    Tenderer.create(
        email: Faker::Internet.email,
        password_digest: Faker::Internet.password,
    )
end

puts "🌱 Seeding Suppliers..."
3.times do
    Supplier.create(
        email: Faker::Internet.email,
        password_digest: Faker::Internet.password,
        company_name: Faker::Company.name,
        company_address: Faker::Address.full_address,
        company_telephone: Faker::PhoneNumber.phone_number,
    )
end

# 3.times do
#     tenderer = Tenderer.order("RANDOM()").first
#     Tender.create(
#         tender_name: ,
#         tender_category: ,
#         tender_description: ,
#         timeline: ,
#         application_deadline: ,
#         budget: ,
#         tenderer_id: tenderer.id,
#     )
# end

# puts "🌱 Seeding Tenders..."

# Tender.create(tender_name:"FRAMEWORK CONTRACT FOR REGIONAL EMERGENCIES",
#                         tender_category: "Open",
#                         tender_description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem",
#                         timeline: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today),
#                         application_deadline: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today),
#                         budget: 12000,
#                         tenderer_id: 1
#                         )

# Tender.create(tender_name:"SUPPLY DELIVERY AND INSTALLATION OF PREFABRICATED OFFICES",
#                         tender_category: "Restricted",
#                         tender_description: "Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por",
#                         timeline: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today),
#                         application_deadline: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today),
#                         budget: 10000,
#                         tenderer_id: 1
#                         )

# Tender.create(tender_name:"PROPOSED RENOVATION OF DADAAB SUB COUNTY HOSPITAL.",
#                         tender_category: "Open",
#                         tender_description: "Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por",
#                         timeline: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today),
#                         application_deadline: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today),
#                         budget: 7000,
#                         tenderer_id: 1
#                         )


puts "✅ Done seeding!"