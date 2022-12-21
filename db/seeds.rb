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

tax_images =["https://educationnewshub.co.ke/wp-content/uploads/2020/12/taxcomp.png",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlOy0DGb5tdZ-E1Q-g5hWrQ_lR7c1ujkMVlw&usqp=CAU",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5bfbcq_RT-KQ3pTNqLodOYvCUcKRZBw9OvQ&usqp=CAU"]

kra_pins = ["A017678398W", "A007678398N", "A011563009Z"]

council_images = ["https://i.pinimg.com/236x/49/f6/da/49f6da2d9036ed9d8a05f3d439fa9328.jpg",
                "https://i.pinimg.com/236x/f5/ae/23/f5ae233c2067790871bb4512eaf626a1.jpg",
                "https://i.pinimg.com/236x/66/a4/05/66a405c83e1fee059e5ec1432dfd9131.jpg"]

bank_images = ["https://i.pinimg.com/236x/64/82/5a/64825ae27a10a20f255bae6fa8dc277e.jpg",
                "https://i.pinimg.com/236x/6c/70/a1/6c70a1d1763774d7e07c86d5ae902362.jpg",
                "https://i.pinimg.com/236x/0e/70/82/0e7082d38c9dfa34cf32b50f30683419.jpg"]

amount = [10000, 5000, 18000]

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

puts "🌱 Seeding Tenders..."

tender = Tender.create(tender_name:"FRAMEWORK CONTRACT FOR REGIONAL EMERGENCIES",
                tender_category: "Open",
                tender_description: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem",
                timeline: Faker::Date.in_date_period(year: 2022, month: 10),
                application_deadline: Faker::Date.in_date_period(year: 2023, month: 1),
                budget: 12000,
                tenderer_id: 1
                )

tender = Tender.create(tender_name:"SUPPLY DELIVERY AND INSTALLATION OF PREFABRICATED OFFICES",
                tender_category: "Restricted",
                tender_description: "Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por",
                timeline: Faker::Date.in_date_period(year: 2022, month: 10),
                application_deadline: Faker::Date.in_date_period(year: 2023, month: 1),
                budget: 10000,
                tenderer_id: 1
                )

tender = Tender.create(tender_name:"PROPOSED RENOVATION OF DADAAB SUB COUNTY HOSPITAL.",
                tender_category: "Open",
                tender_description: "Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por",
                timeline: Faker::Date.in_date_period(year: 2022, month: 10),
                application_deadline: Faker::Date.in_date_period(year: 2023, month: 1),
                budget: 7000,
                tenderer_id: 1
                )

puts "🌱 Seeding Proposals..."
3.times do |i|
    tender.proposals << Proposal.create(
        kra_pin: kra_pins[i],
        company_license: council_images[i],
        bank_statements: bank_images[i],
        tax_compliance: tax_images[i],
        council_registration: council_images[i],
        proposal_amount: amount[i],
        status: false,
        supplier_id: 1,
        tender_id: 1
        )
end

puts "🌱 Seeding Proposal Scores..."

price = [16, 20, 9]
completion = [17,22,25]
quality = [19, 21, 16]
maintenance = [20, 19, 23]
proposal = [1,2,3]

3.times do |i|
    ProposalScore.create(
        quality: quality[i],
        maintenance: maintenance[i],
        completion_period: completion[i],
        price: price[i],
        proposal_id: proposal[i]
    )
end


puts "✅ Done seeding!"