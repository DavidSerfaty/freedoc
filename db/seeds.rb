# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Doctor.destroy_all
Patient.destroy_all

specialities = ["Allergist", "Anesthesiologist", "Cardiologist", "Dermatologist", "Endocrinologist", "Gastroenterologist", "Hematologist", "Immunologist", "Internist"]

doctors = Array.new
patients = Array.new

30.times do
  doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, specialty: specialities.shuffle.first , zip_code: Faker::Address.zip_code)
  patient =  Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  doctors << doctor
  patients << patient
end

30.times do
  appointment = Appointment.create!(doctor: doctors.shuffle.first, patient: patients.shuffle.first, date: Faker::Date.between(from: '2020-11-01', to: '2020-12-01'))
end

puts "30 docteurs + 30 patients + 30 rendez-vous"
