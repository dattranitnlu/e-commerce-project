<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container">
    <!-- The Modal -->
    <div class="modal" id="addCategory">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Adding A Category</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <form action="" method="post" class="form-horizontal">
                <!-- Modal body -->
                <div class="modal-body">

                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label for="hf-email" class=" form-control-label">Category name</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <input type="email" id="hf-email" name="category" placeholder="Category name..." class="form-control">
                                <span class="help-block"></span>
                            </div>
                        </div>


                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-dot-circle-o"></i> Submit
                    </button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>

