json.(event, :created_at, :id)
json.(event.user, :email)
json.(event.eventable, :title)
