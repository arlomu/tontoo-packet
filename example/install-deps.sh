#!/bin/bash
# Authentication System Installation Script
# Handles pre-installation checks and setup

echo "Starting auth-system installation..."

# Verify MySQL client is available
if ! command -v mysql &> /dev/null; then
  echo "❌ Error: MySQL client is required but not installed" >&2
  echo "Please install MySQL client first:" >&2
  echo "  Ubuntu/Debian: sudo apt-get install mysql-client" >&2
  echo "  RHEL/CentOS: sudo yum install mysql" >&2
  exit 1
fi

# Check for minimum Node.js version if frontend will be built
if command -v node &> /dev/null; then
  NODE_VERSION=$(node -v | cut -d'v' -f2)
  REQUIRED_VERSION="16.0.0"
  if [ "$(printf '%s\n' "$REQUIRED_VERSION" "$NODE_VERSION" | sort -V | head -n1)" != "$REQUIRED_VERSION" ]; then
    echo "⚠ Warning: Recommended Node.js ${REQUIRED_VERSION}+ found ${NODE_VERSION}"
  fi
fi

# Create default configuration file
CONFIG_FILE="auth-config.yml"
if [ ! -f "$CONFIG_FILE" ]; then
  cat > "$CONFIG_FILE" <<EOL
# Authentication System Configuration
database:
  host: "localhost"      # MySQL server address
  port: 3306             # MySQL port
  name: "auth_db"        # Database name

security:
  min_password_length: 8  # Minimum password characters
  require_special_char: true

logging:
  level: "info"          # Log level (debug, info, warn, error)
EOL

  echo "✅ Created default configuration: $CONFIG_FILE"
  echo "   Please review and edit before production use"
fi

echo "✔ All pre-installation checks passed"
exit 0
