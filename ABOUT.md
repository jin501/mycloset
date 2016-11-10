Users have a closet
Closets has_many :items, belongs to :user

Closets display all of User's item whihc is uploaded through a nested form

Users can signify status of item (at home, lent out, dry cleaners, uo for sale)
  Can mark when wearing that day


Users home page is their closet, but also a tab for "make sale" and to "go to cleaners" and "daily look"
  -"daily look" is just a page of all the looks by date that oyu selected. you can choose to add a real pic too
  -"make sale" is a page to make the sale to trade once you select your item as up for grabs
  -"go to cleaners" is a page to find and select a cleaners and make drop off request
