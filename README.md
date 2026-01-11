# Event-Management-Database (Lucas Oil Stadium)

## Overview
The **Lucas Oil Stadium Event Management Database** is a relational database designed to manage and track events, staff, attendees, facilities, and payments across multiple venues within the stadium. It stores detailed information about past, ongoing, and future events and updates in real time, ensuring that schedules, staff assignments, and operational activities remain fully interconnected.

This database supports both **field events** (e.g., NFL games, concerts, WrestleMania) and **indoor events** (e.g., corporate events, weddings, networking sessions). It is designed for operational efficiency in large-scale venues and enables accurate reporting and data-driven insights.

---

## Key Features
- **Event Management:** Tracks all events, categorized as field or indoor, with linked venues and assigned staff.
- **Staff Management:** Supports front-end staff (crowd management, ushering, registration, hospitality) and back-end staff (maintenance, logistics, IT, security). Staff can be assigned to one event at a time.
- **Attendee & Ticket Management:** Public event attendees generate tickets and payments; private events use guest lists. Supports multiple bookings per attendee with booking and payment statuses (Pending, Completed, Cancelled).
- **Booking & Payment Rules:** Public event bookings have a 30-minute expiry window. Payments are linked to bookings for accurate financial tracking.
- **Event Coordination:** Each event is managed by both an event coordinator and the organizer. Sponsors, staff, and vendors are associated with events through relational tables.
- **Facilities & Services:** Facilities are predefined stadium locations categorized as Event Level, Street Level, Upper Suite Level, and Terrace Level. Vendors provide services like catering, lighting, internet/data, and transportation, with pricing models per event, per person, or hourly.
- **Relational Structure:** The database consists of **13 main tables**: `EVENT`, `EVENT_COORDINATOR`, `ORGANIZER`, `STAFF`, `ATTENDEE`, `TICKET`, `BOOKING`, `PAYMENT`, `FACILITY`, `FACILITY_SERVICE`, `VENDOR`, `SPONSOR`, and `EVENT_SPONSOR`, with subtypes including `FIELD_EVENT`, `INDOOR_EVENT`, `FRONT_END_STAFF`, and `BACK_END_STAFF`.

---

## Database Schema
The relational structure ensures real-time updates and accurate reporting of ongoing activities and events within the stadium. Key relationships include:

- **Staff ↔ Events:** One event can have many staff members; staff work on only one event at a time.
- **Attendees ↔ Tickets/Bookings:** Attendees can have multiple bookings and tickets; each booking/ticket links to a single attendee.
- **Event ↔ Sponsors:** Many-to-many relationship implemented via the `EVENT_SPONSOR` bridge table.
- **Facilities & Services:** Events are automatically assigned to appropriate facilities; services are linked to events and vendors with pricing models.

---

## Documentation
For a detailed project overview, ER diagrams, and sample queries, see the PDF in the `docs/` folder: [Project Documentation PDF](docs/Project.pdf)


## Setup Instructions
1. **Clone this repository:**
   ```bash
   https://github.com/mohidqadeer123/Event-Management-Database-Lucas-Oil-Stadium
   
2. **Open your MySQL environment:**
   Use phpMyAdmin, MySQL Workbench, or MySQL CLI.

3. **Import the database using the provided SQL file:**
   [Database sql file](<u>Event Management Database/Data Book-event_management_database.sql/<u>)

