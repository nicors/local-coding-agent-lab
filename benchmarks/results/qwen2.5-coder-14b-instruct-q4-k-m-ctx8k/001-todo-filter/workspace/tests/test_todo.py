import unittest

from todo import filter_todos


class FilterTodosTests(unittest.TestCase):
    def setUp(self):
        self.todos = [
            {"id": 1, "title": "write docs", "status": "open", "tags": ["docs"]},
            {"id": 2, "title": "fix bug", "status": "done", "tags": ["code"]},
            {"id": 3, "title": "test release", "status": "open", "tags": ["code", "release"]},
        ]

    def test_filters_by_status(self):
        self.assertEqual([1, 3], [item["id"] for item in filter_todos(self.todos, status="open")])

    def test_filters_by_tag(self):
        self.assertEqual([2, 3], [item["id"] for item in filter_todos(self.todos, tag="code")])

    def test_combines_filters(self):
        self.assertEqual([3], [item["id"] for item in filter_todos(self.todos, status="open", tag="code")])

    def test_no_filters_returns_copy_in_original_order(self):
        result = filter_todos(self.todos)
        self.assertEqual([1, 2, 3], [item["id"] for item in result])
        self.assertIsNot(result, self.todos)

    def test_input_is_not_modified(self):
        before = [dict(item, tags=list(item["tags"])) for item in self.todos]
        filter_todos(self.todos, status="open", tag="code")
        self.assertEqual(before, self.todos)


if __name__ == "__main__":
    unittest.main()
