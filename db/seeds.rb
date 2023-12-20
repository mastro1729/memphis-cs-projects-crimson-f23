# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Users

customer1 = Customer.create!(
  email:    'alice@email.com',
  password: 'password'
)

vendor1 = Vendor.create!(
  email:    'bob@email.com',
  password: 'password'
)

# Seed Candle with an associated image
candle1 = Candle.create!(
  name: 'Teddy Dog',
  description: 'Teddy Dog: A medium-sized, red soy wax creation with a delightful vanilla fragrance, capturing the essence of a teddy bear-inspired dog in a charming pose.',
  color: 'White',
  size: 'Medium',
  fragrance: 'Vanilla',
  wax_type: 'Soy Wax',
  pet_type: 'Dog',
  silhouette: 'Pose',
  design_style: 'Shaped',
  price: 10
)

candle1.image.attach(
  io:  File.open(File.join(Rails.root,'/app/assets/images/TeddyDog.webp')),
  filename: 'TeddyDog.webp'
)


# Seed Candle with an associated image
candle2 = Candle.create!(
  name: 'Study Buddy Cat',
  description: 'Study Buddy Cat: A medium-sized, yellow bee wax candle featuring a charming feline pose and a soothing vanilla fragrance—an ideal companion for your cozy study sessions.',
  color: 'Yellow',
  size: 'Medium',
  fragrance: 'Vanilla',
  wax_type: 'Bee Wax',
  pet_type: 'Cat',
  silhouette: 'Pose',
  design_style: 'Shaped',
  price: 9
)

candle2.image.attach(
  io:  File.open(File.join(Rails.root,'/app/assets/images/StudyBuddyCat.png')),
  filename: 'StudyBuddyCat.png'
)

# Seed Candle with an associated image
candle3 = Candle.create!(
  name: 'Feline Charm',
  description: 'Feline Charm Cat: A small black bee wax candle exuding the delightful fragrance of strawberry, adorned with an enchanting cat pose for a touch of whimsical charm.',
  color: 'Black',
  size: 'Small',
  fragrance: 'Strawberry',
  wax_type: 'Bee Wax',
  pet_type: 'Cat',
  silhouette: 'Pose',
  design_style: 'Shaped',
  price: 10
)

candle3.image.attach(
  io:  File.open(File.join(Rails.root,'/app/assets/images/FelineCharm.jpg')),
  filename: 'FelineCharm.jpg'
)

# Seed Candle with an associated image
candle4 = Candle.create!(
  name: 'KittyZen',
  description: 'KittyZen Cat: A large yellow honey wax candle featuring a calming cat pose, infused with the sweet essence of strawberry, perfect for creating a serene ambiance in your space.',
  color: 'Yellow',
  size: 'Large',
  fragrance: 'Strawberry',
  wax_type: 'Honey Wax',
  pet_type: 'Cat',
  silhouette: 'Pose',
  design_style: 'Shaped',
  price: 15
)

candle4.image.attach(
  io:  File.open(File.join(Rails.root,'/app/assets/images/KittyZen.jpg')),
  filename: 'KittyZen.jpg'
)

# Seed Candle with an associated image
candle5 = Candle.create!(
  name: 'WhiskerGlow',
  description: 'WhiskerGlow Dog: A large yellow bee wax candle capturing the essence of a dog pose, accompanied by a delectable chocolate fragrance for a delightful and cozy atmosphere.',
  color: 'Yellow',
  size: 'Large',
  fragrance: 'Chocolate',
  wax_type: 'Bee Wax',
  pet_type: 'Dog',
  silhouette: 'Pose',
  design_style: 'Shaped',
  price: 15
)

candle5.image.attach(
  io:  File.open(File.join(Rails.root,'/app/assets/images/WhiskerGlow.webp')),
  filename: 'WhiskerGlow.webp'
)

candle6 = Candle.create!(
  name: 'PurePup Glow',
  description: 'PurePup Glow Dog: A medium-sized pink bee wax candle featuring an endearing dog pose, complemented by a sweet strawberry fragrance for a pure and delightful canine-inspired ambiance.',
  color: 'Pink',
  size: 'Medium',
  fragrance: 'Strawberry',
  wax_type: 'Bee Wax',
  pet_type: 'Dog',
  silhouette: 'Pose',
  design_style: 'Shaped',
  price: 15
)
candle6.image.attach(
  io: File.open(File.join(Rails.root, '/app/assets/images/PurePupGlow.webp')),
  filename: 'PurePupGlow.webp'
)

candle7 = Candle.create!(
  name: 'Pink Harmony Glow',
  description: 'Pink Harmony Glow Dog: A medium-sized pink bee wax candle with a captivating dog pose, harmonized by a sweet strawberry fragrance for a perfect blend of warmth and tranquility.',
  color: 'Pink',
  size: 'Medium',
  fragrance: 'Strawberry',
  wax_type: 'Bee Wax',
  pet_type: 'Dog',
  silhouette: 'Pose',
  design_style: 'Shaped',
  price: 15
)
candle7.image.attach(
  io: File.open(File.join(Rails.root, '/app/assets/images/PinkHarmonyGlow.jpg')),
  filename: 'PinkHarmonyGlow.jpg'
)

candle8 = Candle.create!(
  name: 'Pawsome Collection',
  description: 'PawsomeGlowCollection Dog Paws: A medium-sized soy wax candle with a delightful strawberry fragrance, featuring an array of adorable dog paw prints for a charming and pawsitively delightful touch to your space.',
  color: 'Mixed',
  size: 'Medium',
  fragrance: 'Strawberry',
  wax_type: 'Soy Wax',
  pet_type: 'Dog',
  silhouette: 'Paw Print',
  design_style: 'Shaped',
  price: 15
)
candle8.image.attach(
  io: File.open(File.join(Rails.root, '/app/assets/images/PawsomeGlowCollection.webp')),
  filename: 'PawsomeGlowCollection.webp'
)

candle9 = Candle.create!(
  name: 'DarkWhisker Glow',
  description: 'DarkWhiskerGlow Cat: A small black soy wax candle capturing the essence of a cat face, infused with the rich aroma of chocolate for a cozy and indulgent feline-inspired experience.',
  color: 'Black',
  size: 'Small',
  fragrance: 'Chocolate',
  wax_type: 'Soy Wax',
  pet_type: 'Cat',
  silhouette: 'Face Only',
  design_style: 'Shaped',
  price: 13
)
candle9.image.attach(
  io: File.open(File.join(Rails.root, '/app/assets/images/DarkWhiskerGlow.jpg')),
  filename: 'DarkWhiskerGlow.jpg'
)

candle10 = Candle.create!(
  name: 'Zen Dog',
  description: 'Zen Dog: A medium-sized black bee wax candle featuring a tranquil dog pose and the indulgent fragrance of chocolate—a perfect addition to create a calming and cozy atmosphere in your space.',
  color: 'Black',
  size: 'Medium',
  fragrance: 'Chocolate',
  wax_type: 'Bee Wax',
  pet_type: 'Dog',
  silhouette: 'Pose',
  design_style: 'Shaped',
  price: 16
)
candle10.image.attach(
  io: File.open(File.join(Rails.root, '/app/assets/images/ZenDog.jpg')),
  filename: 'ZenDog.jpg'
)

candle19 = Candle.create!(
  name: 'Calm Canine',
  description: 'Calm Canine Dog: A medium-sized yellow soy wax candle that captures the essence of a serene dog pose, complemented by a soothing vanilla fragrance—a perfect addition to create a tranquil ambiance in your space.',
  color: 'Yellow',
  size: 'Medium',
  fragrance: 'Vanilla',
  wax_type: 'Soy Wax',
  pet_type: 'Dog',
  silhouette: 'Pose',
  design_style: 'Shaped',
  price: 16
)
candle19.image.attach(
  io: File.open(File.join(Rails.root, '/app/assets/images/CalmCanine.jpg')),
  filename: 'CalmCanine.jpg'
)

candle11 = Candle.create!(
  name: 'MintyPup',
  description: 'MintyPup Dog: A medium-sized green honey wax candle featuring a delightful dog pose and the soothing fragrance of vanilla—an invigorating addition to create a minty-fresh atmosphere in your space.',
  color: 'Green',
  size: 'Medium',
  fragrance: 'Vanilla',
  wax_type: 'Honey Wax',
  pet_type: 'Dog',
  silhouette: 'Pose',
  design_style: 'Shaped',
  price: 16
)
candle11.image.attach(
  io: File.open(File.join(Rails.root, '/app/assets/images/MintyPup.webp')),
  filename: 'MintyPup.webp'
)

candle12 = Candle.create!(
  name: 'Maternal Melted Moments',
  description: 'Maternal Melted Moments Dog: A large white bee wax candle featuring a heartwarming dog pose, infused with the classic fragrance of vanilla, and adorned with printed details for a timeless and comforting addition to your space.',
  color: 'White',
  size: 'Large',
  fragrance: 'Vanilla',
  wax_type: 'Bee Wax',
  pet_type: 'Dog',
  silhouette: 'Pose',
  design_style: 'Printed',
  price: 20
)
candle12.image.attach(
  io: File.open(File.join(Rails.root, '/app/assets/images/MaternalMeltedMoments.jpg')),
  filename: 'MaternalMeltedMoments.jpg'
)


candle13 = Candle.create!(
  name: 'Antique Countenance Canine',
  description: 'Antique Countenance Canine Dog: A large white bee wax candle featuring the distinguished face of a dog, coupled with the classic fragrance of vanilla—a timeless and elegant addition to your decor.',
  color: 'White',
  size: 'Large',
  fragrance: 'Vanilla',
  wax_type: 'Bee Wax',
  pet_type: 'Dog',
  silhouette: 'Face Only',
  design_style: 'Shaped',
  price: 20
)
candle13.image.attach(
  io: File.open(File.join(Rails.root, '/app/assets/images/AntiqueCountenanceCanine.jpg')),
  filename: 'AntiqueCountenanceCanine.jpg'
)


candle14 = Candle.create!(
  name: 'Little Luminary Lick',
  description: 'Little Luminary Lick Dog: A small white soy wax candle featuring the endearing face of a dog, radiating the classic fragrance of vanilla—an enchanting addition to illuminate your space with warmth and charm.',
  color: 'White',
  size: 'Small',
  fragrance: 'Vanilla',
  wax_type: 'Soy Wax',
  pet_type: 'Dog',
  silhouette: 'Face Only',
  design_style: 'Shaped',
  price: 20
)
candle14.image.attach(
  io: File.open(File.join(Rails.root, '/app/assets/images/LittleLuminaryLick.jpg')),
  filename: 'LittleLuminaryLick.jpg'
)


candle15 = Candle.create!(
  name: 'Little Lollipop Flames',
  description: 'Little Lollipop Flames Cat: A small soy wax candle featuring the delightful face of a cat, complemented by the classic fragrance of vanilla—creating a charming and flavorful atmosphere for your space.',
  color: 'Mixed',
  size: 'Small',
  fragrance: 'Vanilla',
  wax_type: 'Soy Wax',
  pet_type: 'Cat',
  silhouette: 'Face Only',
  design_style: 'Shaped',
  price: 25
)
candle15.image.attach(
  io: File.open(File.join(Rails.root, '/app/assets/images/LittleLollipopFlames.jpg')),
  filename: 'LittleLollipopFlames.jpg'
)

candle16 = Candle.create!(
  name: 'Feline Fury Flame',
  description: 'Feline Fury Flame Cat: A medium-sized soy wax candle featuring the fierce face of a cat, enhanced with a decadent chocolate fragrance and adorned with printed details—an expressive and flavorful addition to your space.',
  color: 'Mixed',
  size: 'Medium',
  fragrance: 'Chocolate',
  wax_type: 'Soy Wax',
  pet_type: 'Cat',
  silhouette: 'Face Only',
  design_style: 'Printed',
  price: 25
)
candle16.image.attach(
  io: File.open(File.join(Rails.root, '/app/assets/images/FelineFuryFlame.jpg')),
  filename: 'FelineFuryFlame.jpg'
)


candle17 = Candle.create!(
  name: 'Mellow Red Purr Pillar',
  description: 'Mellow Red Purr Pillar Cat: A large red honey wax candle featuring a serene cat pose, accompanied by the rich fragrance of chocolate—a delightful and comforting addition to your space at an affordable price.',
  color: 'Red',
  size: 'Large',
  fragrance: 'Chocolate',
  wax_type: 'Honey Wax',
  pet_type: 'Cat',
  silhouette: 'Pose',
  design_style: 'Shaped',
  price: 10
)
candle17.image.attach(
  io: File.open(File.join(Rails.root, '/app/assets/images/MellowRedPurrPillar.jpg')),
  filename: 'MellowRedPurrPillar.jpg'
)

candle18 = Candle.create!(
  name: 'SilverMew',
  description: 'SilverMew Cat: A medium-sized silver honey wax candle featuring an elegant cat pose and the soothing fragrance of vanilla—a graceful addition to your space, blending sophistication with a touch of feline charm.',
  color: 'Silver',
  size: 'Medium',
  fragrance: 'Vanilla',
  wax_type: 'Honey Wax',
  pet_type: 'Cat',
  silhouette: 'Pose',
  design_style: 'Shaped',
  price: 16
)
candle18.image.attach(
  io: File.open(File.join(Rails.root, '/app/assets/images/SilverMew.jpg')),
  filename: 'SilverMew.jpg'
)

# Create or update the inventory associated with each candle and assign it to the vendor
Candle.all.each do |candle|
  inventory = candle.inventory || Inventory.new
  inventory.vendor = vendor1
  inventory.count = rand(0..70)
  inventory.save!
  candle.inventory = inventory
  candle.save!
end

exit(0)