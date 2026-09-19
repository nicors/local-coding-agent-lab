import unittest

from greeting import greeting


class GreetingTests(unittest.TestCase):
    def test_smoke_greeting(self):
        self.assertEqual("hello, smoke", greeting())


if __name__ == "__main__":
    unittest.main()
