USE [HoneyMoon]
GO

set identity_insert [Location] on
insert into [Location] ([Id] , [city/region], [Country]) 
VALUES (1, "Bora Bora", "French Polynesia"), (2, "Soufriere", "St.Lucia"), (3, "Maui", "USA") , (4, "Amalfi Coast", "Italy"), (5, "Tahiti", "French Polynesia"), (6, "Bali", "French Polynesia");
set identity_insert [Location] off

set identity_insert [Hotel] on
insert into [Hotel] ([Id], [name], [hotelURL], [hotelImage], [locationId])
VALUES (1,"The St. Regis Resort", "https://www.marriott.com/en-us/hotels/bobxr-the-st-regis-bora-bora-resort/overview/","https://cache.marriott.com/content/dam/marriott-renditions/BOBXR/bobxr-exterior-aerialview-1580-hor-wide.jpg?interpolation=progressive-bilinear&downsize=1440px:*", 1 );

insert into [Hotel] ([Id], [name], [hotelURL], [hotelImage], [locationId])
VALUES(2, "Le Bora Bora", "https://www.leborabora.com/en-gb/the-resort", "https://dbijapkm3o6fj.cloudfront.net/resources/1935,1004,1,6,4,0,600,450/-4153-/20201118062037/pool-overwater-villa.jpeg",1);

insert into [Hotel] ([Id], [name], [hotelURL], [hotelImage], [locationId])
VALUES (3,"InterContinental Bora Bora", "https://thalasso.intercontinental.com/", "https://thalasso.intercontinental.com/wp-content/uploads/2021/05/download.jpg", 1);

insert into [Hotel] ([Id], [name], [hotelURL], [hotelImage], [locationId])
VALUES (4, "Ladera","https://www.ladera.com/the-resort.html", "https://www.ladera.com/uploads/9/8/6/9/98696210/add-19_3_orig.jpg", 2);

insert into [Hotel] ([Id], [name], [hotelURL], [hotelImage], [locationId])
VALUES (5, "Windjammer Landing", "https://www.windjammer-landing.com/", "https://rentylresorts.com/wp-content/uploads/2021/10/windjammer-aerial-hero-beach.jpg",2);

insert into [Hotel] ([Id], [name], [hotelURL], [hotelImage], [locationId])
VALUES (6,"Sugar Beach", "https://www.viceroyhotelsandresorts.com/sugar-beach", "https://media.cntraveler.com/photos/53d9d5e9dcd5888e145a505c/16:9/w_2560%2Cc_limit/viceroy-sugar-beach-st-lucia-st-lucia-102888-2.jpg", 2);

insert into [Hotel] ([Id], [name], [hotelURL], [hotelImage], [locationId])
VALUES (7, "Four Seasons Resort Maui", "https://www.fourseasons.com/maui/", "https://m.fourseasons.com/alt/img-opt/~70.1530.600,8000-0,0000-1798,4000-2248,0000/publish/content/dam/fourseasons/images/web/MAU/MAU_2259_original.jpg", 3);

insert into [Hotel] ([Id], [name], [hotelURL], [hotelImage], [locationId])
VALUES (8, "Wailea Beach Resort by Marriott", "https://cache.marriott.com/content/dam/marriott-renditions/HNMMC/hnmmc-maluhia-0146-hor-wide.jpg?interpolation=progressive-bilinear&downsize=1440px:*",3);

insert into [Hotel] ([Id], [name], [hotelURL], [hotelImage], [locationId])
VALUES (9, "Royal Lahaina", "https://www.royallahaina.com/", "https://www.royallahaina.com/content/uploads/2022/09/Royal_King_Suite_a-scaled-min.jpeg", 3);

insert into [Hotel] ([Id], [name], [hotelURL], [hotelImage], [locationId])
VALUES (10, "Hotel Margherita", "https://hotelmargherita.info/en/", "https://media-cdn.tripadvisor.com/media/photo-s/0e/8e/3f/4d/hotel-margherita.jpg", 4);
set identity_insert [Hotel] off





set identity_insert [Activity] on
insert into [Activity] ([Id], [name], [description], [activityTypeId], [locationid])
VALUES (1, "ATV Tour", "Take a break from lounging on the beach with this fun-filled ATV adventure around Bora Bora. See beautiful sights and travel along paths that you might otherwise miss on a guided tour.", 1, 1);

insert into [Activity] ([Id], [name], [description], [activityTypeId], [locationid])
VALUES (2, "Underwater Scooter Tour", "Let an expert show you the underwater wonders of Bora Bora’s famed lagoon—without getting your hair wet. Book this small-group tour and you’ll zip around the sea floor aboard an underwater scooter. A panoramic dome on the aqua-bike allows you to stay dry and breathe naturally as an electric motor propels you forward. At a depth of 9.8 feet (3 meters), you’ll see a variety of colorful corals and tropical fish.", 1, 1);

insert into [Activity] ([Id], [name], [description], [activityTypeId], [locationid])
VALUES (3, "Far Niente Restaurant (The St. Regis Bora Bora Resort)", "Our restaurant, Far Niente Ristorante, is an homage to the time-honored traditions of Italian cuisine and boasts an assortment of authentic dishes and drinks.", 2, 1);

insert into [Activity] ([Id], [name], [description], [activityTypeId], [locationid])
VALUES (4, "St. Lucia Rain Forest", "Hike through this magnificently lush rainforest and walk among man-sized ferns and giant trees.", 4, 2);

insert into [Activity] ([Id], [name], [description], [activityTypeId], [locationid])
VALUES (5, "Jade Mountain Club", "Drenched in exotic beauty and erupting with flavor, Jade Mountain nourishes both the body and soul. It's Cuisine is created by James Beard award winner, Chef Allen Susser, is a brave new world of tropical flavors. His cuisine is exotic and delicious with a history of fusion, taking Saint Lucia Dining to new heights, in many ways....", 2, 2);

insert into [Activity] ([Id], [name], [description], [activityTypeId], [locationid])
VALUES (6, "Martha's Table", "Local home cooked food at a reasonable price. The food is delicious, the welcome/service first rate. Forget over priced beach restaurants and 5 star hotel with synthetic local cuisine", 2, 2);

insert into [Activity] ([Id], [name], [description], [activityTypeId], [locationid])
VALUES (7, "Lahaina Grill", "We opened in 1990 as a little 55-seat bistro off Lahaina’s thoroughfare called Front Street, and almost 20 years later Lahaina Grill has garnered international-acclaim as culinary Mecca—these days, it’s sometimes difficult to book one of the restaurant’s 130 seats! Considered by many to be Maui’s prettiest, freestanding restaurant, the soft tones are accented by a gorgeous, pressed tin ceiling. The tabletops are set with fine china, flatware and crystal.", 2, 3);

insert into [Activity] ([Id], [name], [description], [activityTypeId], [locationid])
VALUES (8, "Turtle Town Kayak & Snorkel Tour", "Immerse yourself in Hawaii's stunning natural landscapes during this private snorkeling and kayaking tour in South Maui. Discover underwater reefs and get a chance to swim alongside Hawaiian Green Sea Turtles. Enjoy a personalized adventure, adapted to your interests and experience.", 3, 3);

insert into [Activity] ([Id], [name], [description], [activityTypeId], [locationid])
VALUES (9, "Full-Day Capri Island Cruise from Sorrento", "The only way to reach Capri is by boat—and that’s also by far the best way to experience its main attractions. Opt for a more intimate tour on this cruise that’s limited to just 12 people, and check off the main highlights (sea conditions permitting): the Green Grotto, the Marvelous Grotto, and Faraglioni Rocks. Enjoy free time ashore for exploring and lunch (own expense).", 3, 4);

set identity_insert [Activity] off


set identity_insert [ActivityType] on
insert into [ActivityType] ([Id] , [name]) 
VALUES (1, "Guided Tour"), (2, "Restaurant"), (3, "Private Tour"), (4, "Self-guided Tour");
set identity_insert [ActivityType] off

set identity_insert [UserProfile] on
insert into [UserProfile]([Id], [firstName], [lastName], username, email, isAdmin)
Values (1, "William", "Walker", "W.Walker22", "walker22@email.test", 1), (2, "Mildred", "Walton", "MillieWalt", "Millie14@email.test",0), (3, "Ora", "Baldwin", "O.Baldwin@email.test", 0);
set identity_insert [UserProfile] off

set identity_insert [Iteniary] on
INSERT INTO [Iteniary]([Id], [userProfileId], [locationId], [hotelId], [activityId])
VALUES (1, 1,1,1,1), (2,2,3,7,3);
set identity_insert [Iteniary] off