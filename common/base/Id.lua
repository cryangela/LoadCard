local Id = class("Id");

Id.GobalCount = 0;

function Id:getId()
	if not self._id then
		self._id = Id.GobalCount + 1;
		Id.GobalCount = Id.GobalCount + 1;
	end
	return self._id;
end

return Id;