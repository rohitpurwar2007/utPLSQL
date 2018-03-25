PROMPT Does not execute test and reports error when test beforeeach procedure name for a test is invalid

--Arrange
declare
  simple_test ut_test := ut_test(
     a_object_name => 'ut_example_tests'
    ,a_name => 'ut_exampletest'
  );
begin
  simple_test.before_each_list := ut_executables(ut_executable(simple_test, 'invalid setup name', ut_utils.gc_before_each));
  ut_example_tests.g_char2 := null;
--Act
  simple_test.do_execute();
--Assert
  if simple_test.result = ut_utils.tr_error and ut_example_tests.g_char2 is null then
    :test_result := ut_utils.tr_success;
  end if;
end;
/
