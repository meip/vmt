AutoForm.hooks
	updateProfile:
		onSuccess: (operation, result, template)->
			Alert.success 'Profile updated'
		onError: (operation, error, template)->
			Alert.error 'Profile update error: ' + error