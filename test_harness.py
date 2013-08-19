from Unnamed.test_runner import _pt_show_suites


TESTS_SOME_FEATURE_A = 'Unnamed.tests.test_sample'

TESTS_ALL_FEATURE_A = [TESTS_SOME_FEATURE_A_TESTS]

test_suites = {
        'feature a': ['_pt_run_tests', TESTS_ALL_FEATURE_A],
}


_pt_show_suites.register(test_suites)

