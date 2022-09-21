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
# Flight.delete_all

30.times do
  Airport.create(airport_code: codes.sample)
end

100.times do 
  def rand_time(from=7.days.from_now, to=14.days.from_now)
    Time.at(rand(from.to_f..to.to_f))
  end
  departure = Airport.pluck(:id).sample
  arrival = Airport.pluck(:id).sample
  datetime = rand_time
  duration = rand_time(1.hours, 5.hours)
  Flight.create!(
    departure_airport_id: departure,
    arrival_airport_id: arrival,
    departure_time: datetime,
    flight_duration: duration
  )
end
