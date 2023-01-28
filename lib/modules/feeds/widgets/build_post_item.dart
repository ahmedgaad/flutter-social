
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/styles/icon_broken.dart';

class BuildPostItem extends StatelessWidget {
  const BuildPostItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          "https://img.freepik.com/free-photo/charming-overjoyed-feminine-girl-makes-rock-n-roll-gesture-feels-carefree-glad-listens-favourite-music_273609-39066.jpg?w=996&t=st=1674909668~exp=1674910268~hmac=016ae1f360db2d17aa3d257e1a3f5cc3c9e7d76ec8765d5e075cdee85ecb26c7"),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Ahmed Gad',
                                style: GoogleFonts.andika(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.0),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              const Icon(
                                Icons.verified_sharp,
                                color: Colors.blue,
                                size: 18.0,
                              ),
                            ],
                          ),
                          Text(
                            "January 28, 2023 at 11:00 pm",
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 35.0,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[300],
                  ),
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: GoogleFonts.poppins(),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 5.0,
                    bottom: 10.0,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.only(end: 4.0),
                          child: SizedBox(
                            height: 25.0,
                            child: MaterialButton(
                              onPressed: () {},
                              minWidth: 1.0,
                              padding: EdgeInsets.zero,
                              child: Text(
                                "#Software",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Colors.blue,
                                        fontSize: 15.0),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.only(end: 4.0),
                          child: SizedBox(
                            height: 25.0,
                            child: MaterialButton(
                              onPressed: () {},
                              minWidth: 1.0,
                              padding: EdgeInsets.zero,
                              child: Text(
                                "#Flutter",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Colors.blue,
                                        fontSize: 15.0),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 160.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://img.freepik.com/free-vector/group-discussion-concept-illustration_114360-8522.jpg?w=996&t=st=1674908727~exp=1674909327~hmac=13ad991b67da8ad43da5a5a3dccaa07d796d112c4f73af081303139bf2e8e160",
                        ),
                      ),
                      borderRadius: BorderRadius.circular(4.0)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  IconBroken.Heart,
                                  size: 16.0,
                                  color: Colors.red,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  "1200",
                                  style:
                                      Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(
                                  IconBroken.Chat,
                                  size: 16.0,
                                  color: Colors.amber,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  "600 comment",
                                  style:
                                      Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 8.0),
                  child: Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[300],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 18.0,
                              backgroundImage: NetworkImage(
                                  "https://img.freepik.com/free-photo/charming-overjoyed-feminine-girl-makes-rock-n-roll-gesture-feels-carefree-glad-listens-favourite-music_273609-39066.jpg?w=996&t=st=1674909668~exp=1674910268~hmac=016ae1f360db2d17aa3d257e1a3f5cc3c9e7d76ec8765d5e075cdee85ecb26c7"),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "Write a comment ...",
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              const Icon(
                                IconBroken.Heart,
                                size: 16.0,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Like",
                                style:
                                    Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
