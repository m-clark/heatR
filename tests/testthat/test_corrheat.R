corcars = cor(mtcars)

context('corrheat works')
test_that('corrheat works',{
  expect_true(any(class(corrheat(corcars)) == 'd3heatmap'))
})


# Test various conditionals -----------------------------------------------

context('corrheat can handle non-matrix')
test_that('corrheat can handle non-matrix',{
  expect_type(corrheat(as.data.frame(corcars)), 'list')
})

context('corrheat will error with vector')
test_that('corrheat will error with vector',{
  expect_error(corrheat(as.data.frame(corcars)[,1]))
})



context('corrheat can handle null rownames and columnnames')
test_that('corrheat can null rownames',{
  expect_type(corrheat(corcars, labRow = NULL, labCol = NULL), 'list')
})

context('corrheat can will err with messed up dimnames')
test_that('corrheat can null rownames',{
  colnames(corcars) = rev(colnames(corcars))
  expect_error(corrheat(corcars))
})

context('corrheat can will warn with cex dubious cex or work with correct')
test_that('corrheat can take cexRow',{
  expect_type(corrheat(corcars, cexRow=2), 'list')
})
test_that('corrheat can take cexCol',{
  expect_type(corrheat(corcars, cexCol=2), 'list')
})
test_that('corrheat will warn with bad cexRow and ignore',{
  expect_warning(corrheat(corcars, cexRow='a'))
})
test_that('corrheat will warn with bad cexCol and ignore',{
  expect_warning(corrheat(corcars, cexCol='a'))
})

context('Message for NULL psych options')
test_that('Message for NULL psych options',{
  expect_message(corrheat(corcars))
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

context('corrheat can take cellnote argument')
test_that('corrheat can take cellnote argument',{
  x = matrix(1, 11, 11)
  dimnames(x) = list(colnames(mtcars), colnames(mtcars))
  expect_type(corrheat(corcars, cellnote = x), 'list')
})




# Test factanal stuff -----------------------------------------------------

context('corrheat can use small data')
test_that('corrheat can use small data',{
  expect_type(corrheat(corcars[1:3,1:3]), 'list')
})


context('corrheat can use psych options')
test_that('corrheat can use psych options',{
  expect_type(corrheat(corcars, psychOptions = list(rotate='oblimin')), 'list')
})

context('corrheat can use factanal')
test_that('corrheat can use factanal options',{
  expect_type(corrheat(corcars, factanalOptions = list(control=list(opt=list(maxit=100)))), 'list')
})

context('corrheat will appropriately fail with factanal')
test_that('corrheat will appropriately fail with factanal',{
  expect_error(corrheat(corcars, factanalOptions = list(scores='regression')))
})


context('corrheat can will error if psych options misnamed')
test_that('corrheat can will error if psych options misnamed',{
  expect_error(corrheat(corcars, psychOptions = list(rotation='oblimin')))
})

context('corrheat can take ordering argument')
test_that('corrheat can take ordering argument',{
  expect_true(class(corrheat(corcars, ordering = 'absolute'))[1] == 'd3heatmap')
})




# Test shiny related ------------------------------------------------------

context('corrheatOutput can work')
test_that('corrheatOutput can work',{
  expect_s3_class(corrheatOutput(corrheat(corcars)), 'list')
})

context('renderCorrheat can work')
test_that('renderCorrheat can work',{
  expect_s3_class(renderCorrheat({corrheatOutput(corrheat(corcars))}), 'function')
})
