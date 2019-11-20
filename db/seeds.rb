#make sure the DB is cleaned before seeding it again:
# InternationalClient.reindex
# User.reindex
# FileUpload.reindex
# AccountingData.reindex

# message to the user:
puts "deleting data"
#actions on former DB data:

AccountingDatum.destroy_all
FileUpload.destroy_all
User.destroy_all
InternationalClient.destroy_all


# sample of international client DB:
puts "creating international_clients"

international_client1 = InternationalClient.create!(name: "Fooding Incorp")
international_client2 = InternationalClient.create!(name: "ChaiTea International")


# sample of user database (take seeds from FinConsult and integrate the HO information):
puts "creating users"


user1 = User.create!(first_name: "Elizabeth", last_name:"Delacroix", password: '123456', email: "Liz@gmail.com", profile_picture: "https://res.cloudinary.com/dmwpalbj8/image/upload/v1573283151/l5bbvkciodm64uqieven.jpg", international_client: InternationalClient.first)
# user1.profile_picture = "https://res.cloudinary.com/dmwpalbj8/image/upload/v1573283151/l5bbvkciodm64uqieven.jpg"
# user1.save
user2 = User.create!(first_name: "John", last_name: "Robinson", password: '123456', email: "John@gmail.com", profile_picture: "https://res.cloudinary.com/dmwpalbj8/image/upload/v1573283152/oxfnbmemwrvmg3qlsyjv.jpg", international_client: InternationalClient.last)
# user2.profile_picture = "https://res.cloudinary.com/dmwpalbj8/image/upload/v1573283152/oxfnbmemwrvmg3qlsyjv.jpg"
# user2.save
user3 = User.create!(first_name: "Steve", last_name: "McMaony", password: '123456', email: "stevefromfenix@gmail.com", profile_picture: "https://res.cloudinary.com/dmwpalbj8/image/upload/v1573283152/tn4nxfuwsuth4utr5w3v.jpg", international_client: InternationalClient.first)
# user3.profile_picture = "https://res.cloudinary.com/dmwpalbj8/image/upload/v1573283152/tn4nxfuwsuth4utr5w3v.jpg"
# user3.save
user4 = User.create!(first_name: "Liza", last_name: "Lacroix", password: '123456', email: "Liza@gmail.com", profile_picture: "https://res.cloudinary.com/dmwpalbj8/image/upload/v1574262452/bouffe_liza-frulla_photo_hqbfsk.jpg", international_client: InternationalClient.last)
# user4.profile_picture = "https://res.cloudinary.com/dmwpalbj8/image/upload/v1574262452/bouffe_liza-frulla_photo_hqbfsk.jpg"
# user4.save
user5 = User.create!(first_name: "Bill", last_name: "Clinton", password: '123456', email: "Bill@gmail.com", profile_picture: "https://res.cloudinary.com/dmwpalbj8/image/upload/v1574262451/i_zlFpOX_400x400_in4wba.jpg", international_client: InternationalClient.first)
# user5.profile_picture = "https://res.cloudinary.com/dmwpalbj8/image/upload/v1574262451/i_zlFpOX_400x400_in4wba.jpg"
# user5.save
user6 = User.create!(first_name: "Samantha", last_name: "Fischer", password: '123456', email: "Samantha@gmail.com", profile_picture: "https://res.cloudinary.com/dmwpalbj8/image/upload/v1574262451/Samantha-Sudre-Roux-1-e1477573439274-300x300_wvkbdr.jpg", international_client: InternationalClient.first)
# user6.profile_picture = "https://res.cloudinary.com/dmwpalbj8/image/upload/v1574262451/Samantha-Sudre-Roux-1-e1477573439274-300x300_wvkbdr.jpg"
# user6.save
user7 = User.create!(first_name: "Alex", last_name: "Alabama", password: '123456', email: "Alex@gmail.com", profile_picture: "https://res.cloudinary.com/dmwpalbj8/image/upload/v1574262452/wong_alex_l13932_gks1ae.jpg", international_client: InternationalClient.first)
# user7.profile_picture = "https://res.cloudinary.com/dmwpalbj8/image/upload/v1574262452/wong_alex_l13932_gks1ae.jpg"
# user7.save
user8 = User.create!(first_name: "Camilla", last_name: "Williams", password: '123456', email: "Camilla@gmail.com", profile_picture: "https://res.cloudinary.com/dmwpalbj8/image/upload/v1574262452/GettyImages-500466702_t3q7sx.jpg", international_client: InternationalClient.last)
# user8.profile_picture = "https://res.cloudinary.com/dmwpalbj8/image/upload/v1574262452/GettyImages-500466702_t3q7sx.jpg"
# user7.save

# sample of file upload list:
puts "creating files"

file_upload1 = FileUpload.create!(reinsurance_network: "Network 1" , balance_year: 2018, quarter: 1, file_name: "Q1_2018", user: User.all.sample)
file_upload2 = FileUpload.create!(reinsurance_network: "Network 1" , balance_year: 2018, quarter: 2, file_name: "Q2_2018", user: User.all.sample)
file_upload3 = FileUpload.create!(reinsurance_network: "Network 2" , balance_year: 2016, quarter: 3, file_name: "Q3_2016", user: User.all.sample)
file_upload4 = FileUpload.create!(reinsurance_network: "Network 2" , balance_year: 2016, quarter: 4, file_name: "Q4_2016", user: User.all.sample)
file_upload5 = FileUpload.create!(reinsurance_network: "Network 3" , balance_year: 2017, quarter: 1, file_name: "Q1_2017", user: User.all.sample)
file_upload6 = FileUpload.create!(reinsurance_network: "Network 4" , balance_year: 2017, quarter: 2, file_name: "Q2_2017", user: User.all.sample)

# sample of xls database:
puts "creating data_inputs"

accounting_data1 = AccountingDatum.create!(balance_year: 2018, quarter: 1, local_insurer: "Local Insurer 6", geo_area: "Western Europe", country: "Italy", product: "Captive", business_division: "Manufacturing", local_client: "Local Entity 3", reinsurance_network: "Network 2", risk: "Life", policy_number: "81", benefit: "GL", premium: 24822.26, earned_premium: 24822.26, premium_and_reserves_change: 24822.26, claim_paid: -6404.92, claim_paid_and_reserves_change: 769.61, reinsurance_comm: -2503.04, broker_comm: 0, profit_sharing: 0, taxes: -650.1, interests: 734.01, balance: 23172.74, file_upload: FileUpload.all.sample)
accounting_data2 = AccountingDatum.create!(balance_year: 2018, quarter: 1, local_insurer: "Local Insurer 6", geo_area: "Western Europe", country: "Italy", product: "Captive", business_division: "Manufacturing", local_client: "Local Entity 3", reinsurance_network: "Network 2", risk: "Disability", policy_number: "81", benefit: "DP", premium: 220242.75, earned_premium: 220242.75, premium_and_reserves_change: 220242.75, claim_paid: -109494.01, claim_paid_and_reserves_change: 106512.35, reinsurance_comm: -22214.18, broker_comm: 0, profit_sharing: 0, taxes: -5770.19, interests: 11621.09, balance: 310391.82, file_upload: FileUpload.all.sample)
accounting_data3 = AccountingDatum.create!(balance_year: 2018, quarter: 2, local_insurer: "Local Insurer 6", geo_area: "Western Europe", country: "Italy", product: "Captive", business_division: "Manufacturing", local_client: "Local Entity 3", reinsurance_network: "Network 2", risk: "Disability", policy_number: "81", benefit: "DP", premium: 243083.97, earned_premium: 243083.97, premium_and_reserves_change: 243083.97, claim_paid: -214649.33, claim_paid_and_reserves_change: -453933.05, reinsurance_comm: -24331.64, broker_comm: 0, profit_sharing: 0, taxes: -6368.41, interests: 9798.24, balance: -231750.88, file_upload: FileUpload.all.sample)
accounting_data4 = AccountingDatum.create!(balance_year: 2017, quarter: 1, local_insurer: "Local Insurer 6", geo_area: "Western Europe", country: "Italy", product: "Captive", business_division: "Manufacturing", local_client: "Local Entity 3", reinsurance_network: "Network 2", risk: "Life", policy_number: "81", benefit: "GL", premium: 23836.49, earned_premium: 23836.49, premium_and_reserves_change: 23836.49, claim_paid: -96377.53, claim_paid_and_reserves_change: -71864.12, reinsurance_comm: -2444.67, broker_comm: 0, profit_sharing: 0, taxes: -624.79, interests: 929.87, balance: -50167.21, file_upload: FileUpload.all.sample)
accounting_data5 = AccountingDatum.create!(balance_year: 2017, quarter: 2, local_insurer: "Local Insurer 6", geo_area: "Western Europe", country: "Italy", product: "Captive", business_division: "Manufacturing", local_client: "Local Entity 3", reinsurance_network: "Network 2", risk: "Disability", policy_number: "81", benefit: "DP", premium: 179311.4, earned_premium: 179311.4, premium_and_reserves_change: 179311.4, claim_paid: -164314.39, claim_paid_and_reserves_change: 2537.6, reinsurance_comm: -18486.54, broker_comm: 0, profit_sharing: -20, taxes: -4677.91, interests: 12990.36, balance: 171654.91, file_upload: FileUpload.all.sample)
accounting_data6 = AccountingDatum.create!(balance_year: 2017, quarter: 2, local_insurer: "Local Insurer 6", geo_area: "Western Europe", country: "Italy", product: "Captive", business_division: "Manufacturing", local_client: "Local Entity 3", reinsurance_network: "Network 2", risk: "Accident", policy_number: "54", benefit: "AD", premium: 3279.49, earned_premium: 3279.49, premium_and_reserves_change: 3279.49, claim_paid: 0, claim_paid_and_reserves_change: 230.07, reinsurance_comm: -336.32, broker_comm: -10, profit_sharing: 0, taxes: -85.74, interests: 28.61, balance: 3106.11, file_upload: FileUpload.all.sample)
accounting_data7 = AccountingDatum.create!(balance_year: 2016, quarter: 3, local_insurer: "Local Insurer 4", geo_area: "Middle East & Africa", country: "Pakistan", product: "Captive", business_division: "Distribution", local_client: "Local Entity 75", reinsurance_network: "Network 3", risk: "Accident", policy_number: "abc10", benefit: "AD", premium: 332.83, earned_premium: 120.46, premium_and_reserves_change: 120.46, claim_paid: 0, claim_paid_and_reserves_change: 0, reinsurance_comm: -49.92, broker_comm: -100, profit_sharing: 100, taxes: 0, interests: 0, balance: 70.54, file_upload: FileUpload.all.sample)
accounting_data8 = AccountingDatum.create!(balance_year: 2016, quarter: 3, local_insurer: "Local Insurer 4", geo_area: "Middle East & Africa", country: "Pakistan", product: "Captive", business_division: "Distribution", local_client: "Local Entity 75", reinsurance_network: "Network 3", risk: "Life", policy_number: "abc10", benefit: "GL", premium: 8245.6, earned_premium: 6136.62, premium_and_reserves_change: 6136.62, claim_paid: -45, claim_paid_and_reserves_change: 168.28, reinsurance_comm: -1236.84, broker_comm: 0, profit_sharing: 0, taxes: 0, interests: 13.88, balance: 5081.94, file_upload: FileUpload.all.sample)
accounting_data9 = AccountingDatum.create!(balance_year: 2016, quarter: 3, local_insurer: "Local Insurer 4", geo_area: "Middle East & Africa", country: "Pakistan", product: "Captive", business_division: "Distribution", local_client: "Local Entity 75", reinsurance_network: "Network 3", risk: "Medical", policy_number: "abc10", benefit: "GME", premium: -246.79, earned_premium: 10502.82, premium_and_reserves_change: 10502.82, claim_paid: -4530.82, claim_paid_and_reserves_change: -4724.84, reinsurance_comm: 37.02, broker_comm: 0, profit_sharing: 0, taxes: 0, interests: 153.71, balance: 5968.71, file_upload: FileUpload.all.sample)
accounting_data10 = AccountingDatum.create!(balance_year: 2016, quarter: 4, local_insurer: "Local Insurer 7", geo_area: "APAC", country: "Australia", product: "Captive", business_division: "Finance", local_client: "Local Entity 10", reinsurance_network: "Network 1", risk: "Medical", policy_number: "GL-2008-XYZ", benefit: "GME", premium: 172426.8, earned_premium: 172426.8, premium_and_reserves_change: 172426.8, claim_paid: -126570.8, claim_paid_and_reserves_change: -159594.66, reinsurance_comm: -20691.22, broker_comm: -9909.1, profit_sharing: 0, taxes: 0, interests: 0, balance: -17768.18, file_upload: FileUpload.all.sample)





