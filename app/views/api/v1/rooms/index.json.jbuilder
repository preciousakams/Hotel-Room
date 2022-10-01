# show all rooms
json.array! @rooms do |room|
  json.partial! 'rooms/room', room:
end
