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

30.times do
  Airport.create(airport_code: codes.sample)
end

100.times do 

  departure = Airport.pluck(:id).sample
  arrival = Airport.pluck(:id).sample
  datetime = rand(2.days.from_now.to_i..14.days.from_now.to_i)
  duration = 1.hour.to_i
  Flight.create(
    departure_airport_id: departure,
    arrival_airport_id: arrival,
    departure_time: datetime,
    flight_duration: duration
  )
end
