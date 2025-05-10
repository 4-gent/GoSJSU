<!-- Calendar Modal -->
<div id="calendarModal" class="calendar-modal">
  <div class="calendar-modal-content">
    <span class="calendar-modal-close">&times;</span>
    <h2 class="calendar-modal-title">Academic Calendar - Spring 2025</h2>
    <div id="fullCalendarList" class="event-list">
      <!-- Content will be populated via JavaScript -->
    </div>
  </div>
</div>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    // Get modal and close button
    const modal = document.getElementById('calendarModal');
    const closeBtn = modal.querySelector('.calendar-modal-close');
    
    // Close modal when clicking the close button
    closeBtn.addEventListener('click', function() {
      modal.classList.remove('active');
    });
    
    // Close modal when clicking outside the content
    window.addEventListener('click', function(event) {
      if (event.target === modal) {
        modal.classList.remove('active');
      }
    });
    
    // Function to open the modal and populate with calendar events
    window.openCalendarModal = function() {
      // Get all academic calendar events
      const events = window.academicCalendar || [];
      const eventList = document.getElementById('fullCalendarList');
      
      if (events.length === 0) {
        eventList.innerHTML = '<div class="empty-state">No calendar events available.</div>';
        modal.classList.add('active');
        return;
      }
      
      // Sort events by date
      const sortedEvents = [...events].sort((a, b) => a.date - b.date);
      
      // Generate HTML for each event
      let html = '';
      sortedEvents.forEach(event => {
        const daysRemaining = window.AcademicCalendar.getDaysRemaining(event.date);
        const daysLabel = window.AcademicCalendar.getDaysRemainingLabel(daysRemaining);
        const urgencyClass = daysRemaining <= 7 ? 'urgent' : daysRemaining <= 14 ? 'soon' : '';
        const formattedDate = window.AcademicCalendar.formatDate(event.date);
        
        html += `
          <div class="event-item ${urgencyClass}">
            <div class="event-date">${formattedDate}</div>
            <div class="event-details">
              <div class="event-name">${event.name}</div>
              ${event.description ? `<div class="event-description">${event.description}</div>` : ''}
            </div>
            <div class="event-countdown">${daysLabel}</div>
          </div>
        `;
      });
      
      eventList.innerHTML = html;
      modal.classList.add('active');
    };
    
    // Populate the calendar list on load to ensure it's ready
    const fullCalendarList = document.getElementById('fullCalendarList');
    if (fullCalendarList && window.AcademicCalendar) {
      // Get all events
      const sortedEvents = [...academicCalendar].sort((a, b) => a.date - b.date);
      
      // Generate HTML for each event
      let html = '';
      sortedEvents.forEach(event => {
        const daysRemaining = window.AcademicCalendar.getDaysRemaining(event.date);
        const daysLabel = window.AcademicCalendar.getDaysRemainingLabel(daysRemaining);
        const urgencyClass = daysRemaining <= 7 ? 'urgent' : daysRemaining <= 14 ? 'soon' : '';
        const formattedDate = window.AcademicCalendar.formatDate(event.date);
        
        html += `
          <div class="event-item ${urgencyClass}">
            <div class="event-date">${formattedDate}</div>
            <div class="event-details">
              <div class="event-name">${event.name}</div>
              ${event.description ? `<div class="event-description">${event.description}</div>` : ''}
            </div>
            <div class="event-countdown">${daysLabel}</div>
          </div>
        `;
      });
      
      fullCalendarList.innerHTML = html;
    }
  });
</script> 