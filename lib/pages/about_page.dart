Center(
  child: ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 700),
    child: Column(
      children: [
        const SizedBox(height: 48),

        // Avatar
        CircleAvatar(
          radius: 72,
          backgroundImage: AssetImage('assets/me.jpg'),
        ),

        const SizedBox(height: 24),

        // Name
        Text(
          'Carlos Vts',
          style: Theme.of(context).textTheme.headlineSmall,
        ),

        const SizedBox(height: 8),

        // Role
        Text(
          'Computer Science • Low-level systems',
          style: Theme.of(context).textTheme.bodySmall,
        ),

        const SizedBox(height: 48),

        // About section
        AboutSection(),
        FormationSection(),
        InterestsSection(),
      ],
    ),
  ),
)
