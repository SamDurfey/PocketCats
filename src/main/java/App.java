import java.util.*;
import java.util.Map;
import java.util.HashMap;
import spark.ModelAndView;
import spark.template.velocity.VelocityTemplateEngine;
import static spark.Spark.*;
import org.sql2o.*;
import java.util.List;
import java.util.ArrayList;

public class App {
  public static void main(String[] args) {
    staticFileLocation("/public");
    String layout = "templates/layout.vtl";

    get("/", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("cats", Cat.all());
      model.put("template", "templates/index.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/cats", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("cats", Cat.all());
      model.put("users", User.all());
      model.put("template", "templates/cats.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    get("/cat/:id", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      Cat newCat = Cat.find(Integer.parseInt(request.params(":id")));
      model.put("cat", newCat);
      model.put("users", User.all());
      model.put("template", "templates/cat.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("cats/new", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      int userId = Integer.parseInt(request.queryParams("idUser"));
      String name = request.queryParams("catName");
      String description = request.queryParams("catDescription");
      //String location = request.queryParams("catLocation");
      //String date = request.queryParams("catDate");
      Boolean status = false;
      Cat newCat = new Cat(name, description, status, userId);
      newCat.save();
      User newUser = User.find(userId);
      newUser.addCat(newCat);
      response.redirect("/cats");
      return null;
    });

    post("/cat/:id/comment/new", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      int catId = Integer.parseInt(request.queryParams("idCat"));
      int userId = Integer.parseInt(request.queryParams("idUser"));
      String username = (User.find(userId)).getName();
      String description = request.queryParams("description");
      Comment newComment = new Comment(description, username);
      newComment.saveToCatAndUser(catId, userId);
      response.redirect("/cat/" + catId);
      return null;
    });

    post("/user/new", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      String name = request.queryParams("name");
      User newUser = new User(name);
      newUser.save();
      response.redirect("/cats");
      return null;
    });

    get("/search", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      model.put("cats", Cat.all());
      model.put("users", User.all());
      model.put("template", "templates/search.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());

    post("/search/:id", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      int userId = Integer.parseInt(request.queryParams("idUser"));
      response.redirect("/search/" + userId);
      return null;
    });

    get("/search/:id", (request, response) -> {
      Map<String, Object> model = new HashMap<String, Object>();
      User thisUser = User.find(Integer.parseInt(request.params(":id")));
      model.put("thisUser", thisUser);
      model.put("template", "templates/search.vtl");
      return new ModelAndView(model, layout);
    }, new VelocityTemplateEngine());
  }
}



// model.put("template", "templates/index.vtl");
// = new Review;
//  newReview.saveReviewToRestaurant(":id")
//  model.put(":id", request.params(:id))
