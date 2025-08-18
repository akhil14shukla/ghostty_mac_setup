fetch_weather() {
    echo "=== Weather Update for Bangalore, India - $(date) ==="
    echo ""
    
    # Current weather and 2-day forecast
    echo "📍 Current Weather & 2-Day Forecast:"
    curl -s "wttr.in/12.9554,77.7086?2&A&q&F"
    echo ""
    
    # Moon phase information
    echo "🌙 Moon Phase:"
    curl -s "wttr.in/Bangalore?format=%m"
    echo ""
    echo "=================================="
    echo ""
}

# Main execution
echo "Starting Bangalore Weather Monitor..."
echo "Updates every 10 minutes. Press Ctrl+C to stop."
echo ""

# Initial fetch
fetch_weather

# Loop to update every 10 minutes (600 seconds)
while true; do
    sleep 600  # 10 minutes = 600 seconds
    fetch_weather
done