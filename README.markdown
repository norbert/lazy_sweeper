LazySweeper
===========

This is certainly one of the easiest solutions for the second hardest thing in computer science. It is based on a [post by Thijs at Fingertips][1].

Have fun sweeping your entire page cache.

Add models by calling `LazySweeper.observe` in an initializer. You can also call `LazySweeper.run` manually if needed.

For more information, you can check the [Rails Envy article on page caching][2] that also ripped the original code.

[1]: http://www.fngtps.com/2006/01/lazy-sweeping-the-rails-page-cache "Lazily sweeping the whole Rails page cache"
[2]: http://www.railsenvy.com/2007/2/28/rails-caching-tutorial#clearing "Ruby on Rails Caching Tutorial"
