

context('corrheat works')
test_that('corrheat works',{
  expect_true(any(class(corrheat(cor(mtcars))) == 'd3heatmap'))
})

context('corrheat can handle non-matrix')
test_that('corrheat can handle non-matrix',{
  expect_true(class(corrheat(as.data.frame(cor(mtcars))))[1] == 'd3heatmap')
})

context('Message for NULL psych options')
test_that('Message for NULL psych options',{
  expect_message(corrheat(cor(mtcars)))
})

context('corrheat error for non-square matrix input')
test_that('Error returned for non-square matrices', {
  expect_error(corrheat(mtcars))
})

context('corrheat error for non-symmetric matrix input')
test_that('Error returned for non-symmetric matrices', {
  x = matrix(sample(1:9), ncol = 3)
  expect_error(corrheat(x))
})


context('corrheatOutput can work')
test_that('corrheatOutput can work',{
  expect_s3_class(corrheatOutput(corrheat(cor(mtcars))), 'list')
})

context('renderCorrheat can work')
test_that('renderCorrheat can work',{
  expect_s3_class(renderCorrheat({corrheatOutput(corrheat(cor(mtcars)))}), 'function')
})


context('Warning for problematic args')
test_that('Warning for problematic cexCol',{
  expect_warning(corrheat(cor(mtcars), cexCol = 'a'))
})

test_that('Warning for problematic cexRow',{
  expect_warning(corrheat(cor(mtcars), cexRow = 'a'))
})

context('corrheat can use psych options')
test_that('corrheat can handle non-matrix',{
  expect_true(class(corrheat(as.data.frame(cor(mtcars)), psychOptions = list(rotate='oblimin')))[1] == 'd3heatmap')
})

context('corrheat can will error if psych options misnamed')
test_that('corrheat can will error if psych options misnamed',{
  expect_error(corrheat(cor(mtcars), psychOptions = list(rotation='oblimin')))
})

context('corrheat can take ordering argument')
test_that('corrheat can take ordering argument',{
  expect_true(class(corrheat(cor(mtcars), ordering = 'absolute'))[1] == 'd3heatmap')
})

context('corrheat can take cellnote argument')
test_that('corrheat can take cellnote argument',{
  x = matrix(1, 11, 11)
  dimnames(x) = list(colnames(mtcars), colnames(mtcars))
  expect_true(class(corrheat(cor(mtcars), cellnote = x))[1] == 'd3heatmap')
})
