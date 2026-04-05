enum AppRole {
  admin('Admin'),
  manager('Manager'),
  worker('Worker');

  const AppRole(this.label);

  final String label;
}
