import unittest
import main

class TestFunctions(unittest.TestCase):
    def setUp(self):
            print 'setUp'

    def test_add_three(self):
        self.assertEqual(main.add_three(4), 7)

    def test_add_four(self):
        self.assertEqual(main.add_four(4), 8)
