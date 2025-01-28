# Recipes
Recipes is a SwiftUI app that displays recipes from an API endpoint.

### Features
- **Recipe Display**: Each recipe shows its name, photo, and cuisine type.
- **List Refresh**: Users can refresh the recipe list at any time.
- **Swift Concurrency**: Async/await is used for all asynchronous operations.
- **No External Dependencies**: Only Apple's frameworks are used.
- **Efficient Network Usage**: Images are loaded only when needed and cached to disk.
- **Unit Testing**: Unit tests are included for core logic, such as data fetching and caching.

### Focus Areas
The project focuses on designing and developing a modular and extensible infrastructure to facilitate scaling and faster development of future features. This approach allows for the easy addition of new functionalities and improvements to existing ones without significant rework, ensuring the project can grow and adapt to changing requirements efficiently.

### Time Spent
- **Planning and Design:** ~1 hour
- **Development:** ~7 hours
- **Testing and Debugging:** ~1 hour
- **Documentation:** ~1 hour

### Trade-offs and Decisions
- **Project Structure**: The trade-off was whether to use the project's library/framework targets for defining the modules or Swift packages. This decision impacts how the project is structured, managed, and scaled. Using packages helps in modularizing the codebase.

### Areas for Improvement
These are parts that can be improved:

#### TODO
- [ ] Increase test coverage
- [ ] Add search, sort, and filter functionality
- [ ] Improve adaptation to big screens (replacing List with Grid may help)
- [ ] Multi-language support
- [ ] Accessibility
- [ ] Documentation
- [ ] Add focus views
- [ ] Remove preview content from RecipesUI framework

### Additional Information
- **Supported Platforms**: iOS
- **Minimum OS Target**: iOS 16
- **Swift Version`**: 6
