<form action="#" id="frmGeneratePassword">
    <div class="modal fade" id="modalGeneratePassword">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-info text-white">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">
                        {lang key='generatePassword.title'}
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="alert alert-danger w-hidden" id="generatePwLengthError">
                        {lang key='generatePassword.lengthValidationError'}
                    </div>
                    <div class="form-group row">
                        <label for="generatePwLength" class="col-sm-4 col-form-label">{lang key='generatePassword.pwLength'}</label>
                        <div class="col-sm-8">
                            <input type="number" min="8" max="64" value="12" step="1" class="form-control input-inline input-inline-100" id="inputGeneratePasswordLength">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="generatePwOutput" class="col-sm-4 col-form-label">{lang key='generatePassword.generatedPw'}</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="inputGeneratePasswordOutput">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-8 offset-sm-4">
                            <button type="button" class="btn btn-success btn-sm copy-to-clipboard" data-clipboard-target="#inputGeneratePasswordOutput">
                                {lang key='copy'}
                            </button>
                            <button type="submit" class="btn btn-info btn-sm">
                                <i class="fas fa-plus fa-fw"></i>
                                {lang key='generatePassword.generateNew'}
                            </button>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        {lang key='close'}
                    </button>
                    <button type="button" class="btn btn-primary" id="btnGeneratePasswordInsert" data-clipboard-target="#inputGeneratePasswordOutput">
                        {lang key='generatePassword.copyAndInsert'}
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
