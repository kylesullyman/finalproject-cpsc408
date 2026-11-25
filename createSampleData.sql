USE CampusStage;

# Parent Tables
INSERT INTO Attendees (username, password, name, email) VALUES
                                                            ('calef_a', 'pass123', 'Calef Alesse',      'calef.alesse@chapman.edu'),
                                                            ('kayla_k', 'pass123', 'Kayla Kim',         'kayla.kim@chapman.edu'),
                                                            ('raj_c',   'pass123', 'Raj Chaliparambil', 'raj.chaliparambil@chapman.edu'),
                                                            ('kyle_s',  'pass123', 'Kyle Sullivan',     'kyle.sullivan@chapman.edu');

INSERT INTO Organizers (username, password, name, email) VALUES
                                                             ('org_goldenvoice', 'orgpass1', 'Goldenvoice', 'goldenvoice@example.com'),
                                                             ('org_livenation',  'orgpass1', 'Live Nation', 'livenation@example.com'),
                                                             ('org_insomniac',   'orgpass1', 'Insomniac',   'insomniac@example.com');

INSERT INTO Performers (name, genre) VALUES
                                         ('BUNT.',         'House'),
                                         ('Noah Kahan',    'Folk'),
                                         ('Oasis',         'Rock'),
                                         ('Gracie Abrams', 'Pop'),
                                         ('Drake',         'Rap');

INSERT INTO Venues (name, location, capacity) VALUES
                                                  ('Musco Center for the Arts', 'Chapman University Campus', 1044),   # venueID 1
                                                  ('Chapman Auditorium',        'Memorial Hall',              450),   # venueID 2
                                                  ('Salmon Recital Hall',       'Bertea Hall',                150),   # venueID 3
                                                  ('Attallah Piazza',           'Central Campus (outdoor)',  2000);   # venueID 4

# Events
INSERT INTO Events (venueID, name, eventDate, eventTime, ticketPrice, reservationLimit, status) VALUES
                                                                                                    (1, 'Winterfest',             '2026-12-04', '19:00:00', 15.00,  900, 'Scheduled'),   # eventID 1
                                                                                                    (2, 'Valentines Day Concert', '2027-02-13', '19:30:00', 12.00,  400, 'Scheduled'),   # eventID 2
                                                                                                    (3, 'Spring Acoustic Night',  '2027-03-19', '18:30:00',  0.00,  120, 'Cancelled'),   # eventID 3
                                                                                                    (4, 'Disco Dunes',            '2027-05-10', '16:00:00', 20.00, 1500, 'Scheduled'),   # eventID 4
                                                                                                    (4, 'Homecoming',             '2027-10-16', '18:00:00', 10.00, 1800, 'Scheduled');   # eventID 5

# Tickets
INSERT INTO Tickets (eventID, attendeeID, reservationDate, status) VALUES
                                                                       (1, 1, '2026-11-20 10:15:00', 'Reserved'),    # Calef  -> Winterfest
                                                                       (1, 2, '2026-11-20 11:42:00', 'Reserved'),    # Kayla  -> Winterfest
                                                                       (2, 3, '2026-11-21 09:05:00', 'Reserved'),    # Raj  -> Valentines Day Concert
                                                                       (2, 3, '2026-11-22 14:30:00', 'Reserved'),    # Raj    -> Valentines Day Concert
                                                                       (3, 4, '2026-11-22 16:10:00', 'Cancelled'),   # Kyle   -> Spring Acoustic Night (event cancelled)
                                                                       (4, 1, '2026-11-23 12:00:00', 'Reserved'),    # Calef    -> Disco Dunes
                                                                       (4, 4, '2026-11-23 13:20:00', 'Reserved');    # Kyle   -> Disco Dunes

# Who performs at which event: (eventID, performerID)
INSERT INTO EventPerformers (eventID, performerID) VALUES
                                                       (1, 2), (1, 4),   # Winterfest: Noah Kahan, Gracie Abrams
                                                       (2, 4),           # Valentines Day Concert: Gracie Abrams
                                                       (3, 2),           # Spring Acoustic Night: Noah Kahan
                                                       (4, 1),           # Disco Dunes: BUNT.
                                                       (5, 3), (5, 5);   # Homecoming: Oasis, Drake

# Who manages which event: (eventID, organizerID)
INSERT INTO EventOrganizers (eventID, organizerID) VALUES
                                                       (1, 2),           # Winterfest: Live Nation
                                                       (2, 1),           # Valentines Day Concert: Goldenvoice
                                                       (3, 1),           # Spring Acoustic Night: Goldenvoice
                                                       (4, 3),           # Disco Dunes: Insomniac
                                                       (5, 2), (5, 1);   # Homecoming: Live Nation, Goldenvoice