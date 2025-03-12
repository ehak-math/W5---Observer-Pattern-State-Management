abstract class RidePreferencesListener {
  void onPreferenceSelected(RidePreference selectedPreference);
}


class RidePreferencesService {
  RidePreference? _currentPreference;
  final List<RidePreferencesListener> _listeners = [];

  void addListener(RidePreferencesListener listener) {
    _listeners.add(listener);
  }

  void _notifyListeners() {
    for (var listener in _listeners) {
      if (_currentPreference != null) {
        listener.onPreferenceSelected(_currentPreference!);
      }
    }
  }

  void setPreference(RidePreference preference) {
    _currentPreference = preference;
    _notifyListeners();
  }
}

// 
class ConsoleLogger implements RidePreferencesListener {
  @override
  void onPreferenceSelected(RidePreference selectedPreference) {
    print("Ride preference changed to: ${selectedPreference.name}");
  }
}

// RidePreference class for testing
class RidePreference {
  final String name;
  RidePreference(this.name);
}

void main() {
  final rideService = RidePreferencesService();
  final logger = ConsoleLogger();

  rideService.addListener(logger);

  // preference change
  rideService.setPreference(RidePreference("BMW"));
  rideService.setPreference(RidePreference("Luxury"));
}



