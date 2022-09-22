codes = ["ABR",
  "ABI",
  "ADK",
  "KKI",
  "AKI",
  "CAK",
  "KQA",
  "AUK",
  "ALM",
  "ALS",
  "ALB",
  "CVO",
  "QWY",
  "ABQ",
  "WKK",
  "AEX",
  "AET",
  "ABE",
  "AIA",
  "APN",
  "AOO",
  "AMA",
  "ABL",
  "AKP",
  "ANC",
  "AGN",
  "ANI",
  "ANV",
  "ATW",
  "ACV",
  "ARC",
  "AVL",
  "HTS",
  "ASE",
  "AHN",
  "AKB",
  "ATL",
  "AIY",
  "ATK",
  "AGS",
  "AUG",
  "AUS"]

Airport.delete_all
Flight.delete_all

4.times do
  Airport.create(airport_code: codes.sample)
end

Airport.all.each do |airport|
  departure = airport.id
  arrival = Airport.where.not(id: departure).pluck(:id).sample
  duration = rand(60..300).minutes.to_i

  400.times do 
    datetime = rand(2.days.from_now.to_i..14.days.from_now.to_i)
    Flight.create(
      departure_airport_id: departure,
      arrival_airport_id: arrival,
      departure_time: datetime,
      flight_duration: duration
    )
  end
end