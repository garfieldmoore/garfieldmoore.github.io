---
layout: post
title: Mocking dangers
date: 2014-07-16 19:26:26.000000000 +01:00
categories: TDD
---
Mocking dependencies allow us to create tests that are fast by removing our dependencies on external systems.

However, it's easy to overuse and create brittle tests that become a maintenance burden.

For example, imagine we are creating a To-do list application. We might come up with the below simple design;

![todo design](/assets/images/todo_design.png)  

Given this design we might end up with tests similar to the ones below;

	public class TodoSpecs
	{
	    public class TodoSpecs
	    [Test]
	    public void Service_invokes_repository()
	    {
	        var repository = Substitute.For<IRepository>();
	        var service = new ToDoService(repository, Substitute.For<IMapper<ToDoTask>,TaskResource>() mapper);
	        service.GetAll();
	        repository.Received(1).GetAll();
	     }

	     public void Service_should_return_resources()
	     {
	         var repository = Substitute.For<IRepository>();
	         var toDoTask = new ToDoTask() { Note = "new todo task" };
	         repository.GetAll().Returns(new[] { toDoTask });
	         var mapper = Substitute.For<IMapper<ToDoTask>, TaskResource>();
	         mapper.Map(Arg.Any()).Returns(new TaskResource() { Note = "new todo task" });
	      
	         var service = new ToDoService(repository, mapper);
	         var todos = service.GetAll();
	      
	         &lt;mapper.Received(1).Map(Arg.Is(toDoTask));
	         todos.Count().ShouldBe(1);
	      }

	      public void mapper_should_map_task_to_resource()
	      {
	          var mapper = new TaskResourceMapper();
	          var task = new ToDoTask() { Note = "new todo task" };
	          var resource = mapper.Map(task);
	          resource.Note.ShouldBe(task.Note);
	      }
	}

These tests are trying to prove the service gets all tasks from the repository, converts them to a resource and returns them. At first glance this seems fine. The first test mocks the repository dependency and tests we call the getall() method. This is reasonable as the real repository will be going to a database of some kind.  If we didn't mock this we would have a slow integration test.

##Brittle Tests

The problem is in the second test. The first smell that something is wrong it that the test is hard to understand. We have to mock two things - the repository and the mapper.

This means that any change to the mapper requires us to change our tests in two places; the tests that cover the mapper and the tests that create mock mappers.

Another problem is that to prove we return the correct result to the client, we are testing the collaboration between the mapper and the service. If we remove the mapper we have to change all our tests.

## Testing from the outside
Now, imagine if we just tested this code from the service and treated the mapper as an internal object. We'd probably have something like this;

	[TestFixture]
	public class TodoSpecs2
	{
	    [TestFixture]
	    [Test]
	    public void Service_invokes_repository()
	    {
	        var repository = Substitute.For<IRepository<ToDoTask>>();
	    
	        var service = new ToDoService(repository);
	        service.GetAll();
	    
	        repository.Received(1).GetAll();
	    }

	    public void Service_should_return_resources()
	    {
	        var repository = Substitute.For<IRepository<ToDoTask>>();
	        var toDoTasks = Builder<ToDoTask>.CreateListOfSize(1).Build();    
	        repository.GetAll().Returns(toDoTasks);

	        var service = new ToDoService(repository);
	        var todos = service.GetAll().ToList();

	        todos.Count().ShouldBe(1);
	        todos[0].Note.ShouldBe(toDoTasks[0].Note);
	    }
	}

We have removed the mapper from the services constructor and are not testing the mapper anymore. We are still using the mapper in the service but it is being created in the service.

As a result, the test is much more readable and nothing is lost - the mapper is still covered by this test. However, rather than testing it directly, requiring us to create unneeded dependencies and brittle tests, it is being tested as a side-effect of this test.

That's completely valid - the mapper is cheap to create and consume and it only collaborates privately with the service. We could refactor the code to remove the mapper and our test would still be be valid.

## Conclusion

Overusing mocking creates brittle tests that will inhibit flexibility and decrease productivity. We should only mock objects that are expensive to create or use.

In the example, the mapper was cheap to create and use and did not need to be an external dependency. Treating it as private to the service resulted in more flexible and easier to understand tests.