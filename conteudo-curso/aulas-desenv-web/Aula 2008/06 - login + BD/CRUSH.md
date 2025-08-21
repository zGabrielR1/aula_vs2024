# CRUSH Configuration

## Build & Development
- XAMPP/MySQL required for database operations
- PHP files run through web server (Apache)
- Database setup: Import db/db_exemplo.sql

## Code Style Guidelines
- **PHP**: Use PDO for database operations with prepared statements
- **Naming**: Portuguese language, camelCase for variables/functions, snake_case for DB columns
- **Imports**: External libraries via CDN (Bootstrap, jQuery, Bootstrap Icons)
- **Error Handling**: Try-catch blocks for database operations, JavaScript alerts for user feedback
- **Security**: Session-based authentication, SQL injection prevention
- **HTML**: Bootstrap 5.3.7 for responsive design
- **CSS**: Modular files, Bootstrap utility classes with custom overrides