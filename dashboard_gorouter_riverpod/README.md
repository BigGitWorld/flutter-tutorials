# Dashboard with GoRouter + Riverpod


## Notes:
1. Our Dashboard has the following features:
   - Landing page
   - Login page and redirect to Dashboard Home page after it
   - Sidebar with ``ShellRoute``
   - Sub Routes
   - Logout Dialog and redirect to Landing page
   - Riverpod State Management (User Authentication & GoRouter)
2. I did not use ``GoRouter.of(context).pop()`` after successfull login. 
   because after ``logout`` and redirecting to ``landing page`` or ``login page``,
   I have only ONE page in the navigation stack. So ``pop`` results in ``Nothing to pop`` error.
   <br>And I used ``GoRouter.of(context).go()`` instead.
3. As you know, we can use ``refreshListener``, so that ``redirect`` to be called 
   (for example in ``login`` and ``logout`` buttons).
   But I want to use customized mechanism (go to ``home page`` after successfull login 
   and go to ``landing page`` after successfull logout). 
   So I dont use it here, but you can simply use it in your code.
4. You can debug the code by the provided ``debugPrint`` commands.