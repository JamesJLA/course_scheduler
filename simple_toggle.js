// Simplified custom course form toggle
document.addEventListener('DOMContentLoaded', function() {
  // Wait a bit for all elements to be ready
  setTimeout(function() {
    const toggleButton = document.getElementById('toggle-custom-course-form');
    const cancelButton = document.getElementById('cancel-custom-course');
    const form = document.getElementById('custom-course-form');
    
    console.log('Custom course form setup:');
    console.log('Toggle button exists:', !!toggleButton);
    console.log('Cancel button exists:', !!cancelButton);
    console.log('Form exists:', !!form);
    
    if (toggleButton) {
      toggleButton.addEventListener('click', function(e) {
        e.preventDefault();
        console.log('Toggle clicked!');
        
        if (form) {
          const isHidden = form.style.display === 'none' || form.style.display === '';
          if (isHidden) {
            form.style.display = 'block';
            toggleButton.textContent = 'Hide Form';
            console.log('Form shown');
          } else {
            form.style.display = 'none';
            toggleButton.textContent = 'Add Custom Course';
            console.log('Form hidden');
          }
        } else {
          console.error('Form not found!');
        }
      });
    }
    
    if (cancelButton) {
      cancelButton.addEventListener('click', function(e) {
        e.preventDefault();
        console.log('Cancel clicked!');
        
        if (form) {
          form.style.display = 'none';
        }
        if (toggleButton) {
          toggleButton.textContent = 'Add Custom Course';
        }
        console.log('Form cancelled and hidden');
      });
    }
  }, 100);
});